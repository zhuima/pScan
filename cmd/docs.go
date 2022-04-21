/*
Copyright © 2022 The Pragmatic Programmers, LLC
Copyrights apply to this source code.
Check LICENSE for details.

*/
package cmd

import (
	"fmt"
	"io"
	"io/ioutil"
	"os"

	"github.com/spf13/cobra"
	"github.com/spf13/cobra/doc"
)

// docsCmd represents the docs command.
var docsCmd = &cobra.Command{
	Use:   "docs",
	Short: "Generate documentation for your command",
	RunE: func(cmd *cobra.Command, args []string) error {
		dir, err := cmd.Flags().GetString("dir")
		if err != nil {
			return err
		}

		if dir == "" {
			if dir, err = ioutil.TempDir("", "pScan"); err != nil {
				return err
			}
		}
		return docsAction(os.Stdout, dir)
	},
}

func init() {
	rootCmd.AddCommand(docsCmd)

	docsCmd.Flags().StringP("dir", "d", "", "Destination directory for docs")
	// Here you will define your flags and configuration settings.

	// Cobra supports Persistent Flags which will work for this command
	// and all subcommands, e.g.:
	// docsCmd.PersistentFlags().String("foo", "", "A help for foo")

	// Cobra supports local flags which will only run when this command
	// is called directly, e.g.:
	// docsCmd.Flags().BoolP("toggle", "t", false, "Help message for toggle")
}

func docsAction(out io.Writer, dir string) error {
	if err := doc.GenMarkdownTree(rootCmd, dir); err != nil {
		return err
	}
	_, err := fmt.Fprintf(out, "Documentation successfully created in %s\n", dir)
	return err
}
